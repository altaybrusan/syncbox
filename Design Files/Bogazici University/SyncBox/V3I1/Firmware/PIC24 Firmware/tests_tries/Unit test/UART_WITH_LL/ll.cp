#line 1 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/tests_tries/Unit test/UART_WITH_LL/ll.c"
#line 1 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/tests_tries/unit test/uart_with_ll/ll.h"
#line 29 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/tests_tries/unit test/uart_with_ll/ll.h"
 typedef struct _llnode {
 void* pData;

 struct _llnode* pHead;
 struct _llnode* pNext;
 struct _llnode* pPrev;
 struct _llnode* pTail;
 } linkListDef;

 void addNode(linkListDef* pLL, linkListDef* pNode, void* pData);
 void removeNode(linkListDef* pNode);
#line 14 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/tests_tries/Unit test/UART_WITH_LL/ll.c"
static linkListDef* pTmpLLitr;
#line 18 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/tests_tries/Unit test/UART_WITH_LL/ll.c"
static void initNode(linkListDef* pNode) {
 if ( !pNode ) {
 return;
 }
 pNode->pHead = pNode->pNext = pNode->pPrev = pNode->pTail = 0;
}
#line 31 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/tests_tries/Unit test/UART_WITH_LL/ll.c"
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
#line 75 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/tests_tries/Unit test/UART_WITH_LL/ll.c"
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
