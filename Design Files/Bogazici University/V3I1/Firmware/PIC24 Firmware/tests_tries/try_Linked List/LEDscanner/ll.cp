#line 1 "F:/MikroC/LEDscanner/ll.c"
#line 1 "f:/mikroc/ledscanner/ll.h"
#line 29 "f:/mikroc/ledscanner/ll.h"
 typedef struct _llnode {
 void* pData;

 struct _llnode* pHead;
 struct _llnode* pNext;
 struct _llnode* pPrev;
 struct _llnode* pTail;
 } linkListDef;

 void addNode(linkListDef* pLL, linkListDef* pNode, void* pData);
 void removeNode(linkListDef* pNode);
#line 14 "F:/MikroC/LEDscanner/ll.c"
static linkListDef* pTmpLLitr;
#line 18 "F:/MikroC/LEDscanner/ll.c"
static void initNode(linkListDef* pNode) {
 if ( !pNode ) {
 return;
 }
 pNode->pHead = pNode->pNext = pNode->pPrev = pNode->pTail = 0;
}
#line 31 "F:/MikroC/LEDscanner/ll.c"
void addNode(linkListDef* pLL, linkListDef* pNode, void* pData) {
 int intPass;

 if ( !(pNode && pData) ) {

 return;
 }

 initNode(pNode);

 if ( pLL && !pLL->pHead ) {

 pLL->pHead = pNode;
 }



 for( intPass=1; intPass<=2; intPass++ ) {
 for( pTmpLLitr=pLL; pTmpLLitr; pTmpLLitr=pTmpLLitr->pNext ) {
 if ( intPass == 1 && pTmpLLitr == pNode ) {

 intPass = 2;
 } else if ( intPass == 2 ) {

 pTmpLLitr->pHead = pLL;

 if ( !pTmpLLitr->pNext && pTmpLLitr != pNode ) {

 pTmpLLitr->pNext = pNode;
 pNode->pPrev = pTmpLLitr;
 pNode->pHead = pLL;
 }

 pTmpLLitr->pTail = pNode;
 }
 }
 }

 pNode->pData = pData;
}
#line 75 "F:/MikroC/LEDscanner/ll.c"
void removeNode(linkListDef* pNode) {

 if ( !pNode ) {

 return;
 }
 if ( pNode->pPrev ) {

 pNode->pPrev->pNext = pNode->pNext;
 }
 if ( pNode->pHead == pNode && pNode->pNext ) {

 for( pTmpLLitr=pNode->pHead; pTmpLLitr; pTmpLLitr=pTmpLLitr->pNext ) {
 pTmpLLitr->pHead = pNode->pNext;
 }
 }
 if ( pNode->pTail == pNode && pNode->pPrev ) {

 for( pTmpLLitr=pNode->pHead; pTmpLLitr; pTmpLLitr=pTmpLLitr->pNext ) {
 pTmpLLitr->pTail = pNode->pPrev;
 }
 }
 if ( pNode->pNext ) {

 pNode->pNext->pPrev = pNode->pPrev;
 }

 initNode(pNode);
}
