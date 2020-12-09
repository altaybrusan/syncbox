#line 1 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/jsmn.c"
#line 1 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/jsmn.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for dspic/include/stddef.h"



typedef int ptrdiff_t;
typedef unsigned int size_t;
typedef unsigned int wchar_t;
#line 17 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/jsmn.h"
typedef enum {
 JSMN_UNDEFINED = 0,
 JSMN_OBJECT = 1,
 JSMN_ARRAY = 2,
 JSMN_STRING = 3,
 JSMN_PRIMITIVE = 4
} jsmntype_t;

enum jsmnerr {

 JSMN_ERROR_NOMEM = -1,

 JSMN_ERROR_INVAL = -2,

 JSMN_ERROR_PART = -3
};
#line 40 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/jsmn.h"
typedef struct {
 jsmntype_t type;
 int start;
 int end;
 int size;
#line 48 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/jsmn.h"
} jsmntok_t;
#line 54 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/jsmn.h"
typedef struct {
 unsigned int pos;
 unsigned int toknext;
 int toksuper;
} jsmn_parser;
#line 63 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/jsmn.h"
void jsmn_init(jsmn_parser *parser);
#line 69 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/jsmn.h"
int jsmn_parse(jsmn_parser *parser, const char *js, size_t len,
 jsmntok_t *tokens, unsigned int num_tokens);
#line 6 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/jsmn.c"
static jsmntok_t *jsmn_alloc_token(jsmn_parser *parser,
 jsmntok_t *tokens, size_t num_tokens) {
 jsmntok_t *tok;
 if (parser->toknext >= num_tokens) {
 return  ((void *)0) ;
 }
 tok = &tokens[parser->toknext++];
 tok->start = tok->end = -1;
 tok->size = 0;
#line 18 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/jsmn.c"
 return tok;
}
#line 24 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/jsmn.c"
static void jsmn_fill_token(jsmntok_t *token, jsmntype_t type,
 int start, int end) {
 token->type = type;
 token->start = start;
 token->end = end;
 token->size = 0;
}
#line 35 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/jsmn.c"
static int jsmn_parse_primitive(jsmn_parser *parser, const char *js,
 size_t len, jsmntok_t *tokens, size_t num_tokens) {
 jsmntok_t *token;
 int start;

 start = parser->pos;

 for (; parser->pos < len && js[parser->pos] != '\0'; parser->pos++) {
 switch (js[parser->pos]) {


 case ':':

 case '\t' : case '\r' : case '\n' : case ' ' :
 case ',' : case ']' : case '}' :
 goto found;
 }
 if (js[parser->pos] < 32 || js[parser->pos] >= 127) {
 parser->pos = start;
 return JSMN_ERROR_INVAL;
 }
 }
#line 63 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/jsmn.c"
found:
 if (tokens ==  ((void *)0) ) {
 parser->pos--;
 return 0;
 }
 token = jsmn_alloc_token(parser, tokens, num_tokens);
 if (token ==  ((void *)0) ) {
 parser->pos = start;
 return JSMN_ERROR_NOMEM;
 }
 jsmn_fill_token(token, JSMN_PRIMITIVE, start, parser->pos);
#line 77 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/jsmn.c"
 parser->pos--;
 return 0;
}
#line 84 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/jsmn.c"
static int jsmn_parse_string(jsmn_parser *parser, const char *js,
 size_t len, jsmntok_t *tokens, size_t num_tokens) {
 jsmntok_t *token;

 int start = parser->pos;

 parser->pos++;


 for (; parser->pos < len && js[parser->pos] != '\0'; parser->pos++) {
 char c = js[parser->pos];


 if (c == '\"') {
 if (tokens ==  ((void *)0) ) {
 return 0;
 }
 token = jsmn_alloc_token(parser, tokens, num_tokens);
 if (token ==  ((void *)0) ) {
 parser->pos = start;
 return JSMN_ERROR_NOMEM;
 }
 jsmn_fill_token(token, JSMN_STRING, start+1, parser->pos);
#line 110 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/jsmn.c"
 return 0;
 }


 if (c == '\\' && parser->pos + 1 < len) {
 int i;
 parser->pos++;
 switch (js[parser->pos]) {

 case '\"': case '/' : case '\\' : case 'b' :
 case 'f' : case 'r' : case 'n' : case 't' :
 break;

 case 'u':
 parser->pos++;
 for(i = 0; i < 4 && parser->pos < len && js[parser->pos] != '\0'; i++) {

 if(!((js[parser->pos] >= 48 && js[parser->pos] <= 57) ||
 (js[parser->pos] >= 65 && js[parser->pos] <= 70) ||
 (js[parser->pos] >= 97 && js[parser->pos] <= 102))) {
 parser->pos = start;
 return JSMN_ERROR_INVAL;
 }
 parser->pos++;
 }
 parser->pos--;
 break;

 default:
 parser->pos = start;
 return JSMN_ERROR_INVAL;
 }
 }
 }
 parser->pos = start;
 return JSMN_ERROR_PART;
}
#line 151 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/jsmn.c"
int jsmn_parse(jsmn_parser *parser, const char *js, size_t len,
 jsmntok_t *tokens, unsigned int num_tokens) {
 int r;
 int i;
 jsmntok_t *token;
 int count = parser->toknext;

 for (; parser->pos < len && js[parser->pos] != '\0'; parser->pos++) {
 char c;
 jsmntype_t type;

 c = js[parser->pos];
 switch (c) {
 case '{': case '[':
 count++;
 if (tokens ==  ((void *)0) ) {
 break;
 }
 token = jsmn_alloc_token(parser, tokens, num_tokens);
 if (token ==  ((void *)0) )
 return JSMN_ERROR_NOMEM;
 if (parser->toksuper != -1) {
 tokens[parser->toksuper].size++;
#line 177 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/jsmn.c"
 }
 token->type = (c == '{' ? JSMN_OBJECT : JSMN_ARRAY);
 token->start = parser->pos;
 parser->toksuper = parser->toknext - 1;
 break;
 case '}': case ']':
 if (tokens ==  ((void *)0) )
 break;
 type = (c == '}' ? JSMN_OBJECT : JSMN_ARRAY);
#line 209 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/jsmn.c"
 for (i = parser->toknext - 1; i >= 0; i--) {
 token = &tokens[i];
 if (token->start != -1 && token->end == -1) {
 if (token->type != type) {
 return JSMN_ERROR_INVAL;
 }
 parser->toksuper = -1;
 token->end = parser->pos + 1;
 break;
 }
 }

 if (i == -1) return JSMN_ERROR_INVAL;
 for (; i >= 0; i--) {
 token = &tokens[i];
 if (token->start != -1 && token->end == -1) {
 parser->toksuper = i;
 break;
 }
 }

 break;
 case '\"':
 r = jsmn_parse_string(parser, js, len, tokens, num_tokens);
 if (r < 0) return r;
 count++;
 if (parser->toksuper != -1 && tokens !=  ((void *)0) )
 tokens[parser->toksuper].size++;
 break;
 case '\t' : case '\r' : case '\n' : case ' ':
 break;
 case ':':
 parser->toksuper = parser->toknext - 1;
 break;
 case ',':
 if (tokens !=  ((void *)0)  && parser->toksuper != -1 &&
 tokens[parser->toksuper].type != JSMN_ARRAY &&
 tokens[parser->toksuper].type != JSMN_OBJECT) {



 for (i = parser->toknext - 1; i >= 0; i--) {
 if (tokens[i].type == JSMN_ARRAY || tokens[i].type == JSMN_OBJECT) {
 if (tokens[i].start != -1 && tokens[i].end == -1) {
 parser->toksuper = i;
 break;
 }
 }
 }

 }
 break;
#line 276 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/jsmn.c"
 default:

 r = jsmn_parse_primitive(parser, js, len, tokens, num_tokens);
 if (r < 0) return r;
 count++;
 if (parser->toksuper != -1 && tokens !=  ((void *)0) )
 tokens[parser->toksuper].size++;
 break;
#line 290 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/jsmn.c"
 }
 }

 if (tokens !=  ((void *)0) ) {
 for (i = parser->toknext - 1; i >= 0; i--) {

 if (tokens[i].start != -1 && tokens[i].end == -1) {
 return JSMN_ERROR_PART;
 }
 }
 }

 return count;
}
#line 309 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/jsmn.c"
void jsmn_init(jsmn_parser *parser) {
 parser->pos = 0;
 parser->toknext = 0;
 parser->toksuper = -1;
}
