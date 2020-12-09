/**
 * File:
 *  ll.c
 *
 * Notes:
 *  This file contains the implementation for a linked list.  see ll.h for
 *  more detailed information.
 *
 * History:
 *  17/01/2013 Written by Simon Platten
 */
#include "ll.h"
// Temporary pointer used to iterate through link list
static linkListDef* pTmpLLitr;
/**
 * Initialies a node ready for use
 */
static void initNode(linkListDef* pNode) {
  if ( !pNode ) {
    return;
  }
  pNode->pHead = pNode->pNext = pNode->pPrev = pNode->pTail = 0;
}
/**
 * Adds a node to the linked list
 *  pLL, pointer to linked list, may be the same as pNode
 *  pNode, pointer to the node to add to list
 *  pData, the data to associate with this node
 * When adding the first node pLL should be 0(null)
 */
void addNode(linkListDef* pLL, linkListDef* pNode, void* pData) {
  int intPass;
// Validate parameters
  if ( !(pNode && pData) ) {
// One or both parameters are invalid abort
    return;
  }
// Make sure the new node is initialised
  initNode(pNode);

  if ( pLL && !pLL->pHead ) {
// This is the first node in the linked list, point the head to the node
    pLL->pHead = pNode;
  }
// Make 2 passes
//  Pass 1: Verify new node is not in the list
//  Pass 2: Update all nodes already in the list
  for( intPass=1; intPass<=2; intPass++ ) {
    for( pTmpLLitr=pLL; pTmpLLitr; pTmpLLitr=pTmpLLitr->pNext ) {
      if ( intPass == 1 && pTmpLLitr == pNode ) {
        // Node already exists in linked list, skip pass 2!
        intPass = 2;
      } else if ( intPass == 2 ) {
        // Update each node
        pTmpLLitr->pHead = pLL;
        
        if ( !pTmpLLitr->pNext && pTmpLLitr != pNode ) {
          // Tag the new node onto the end of the list
          pTmpLLitr->pNext = pNode;
          pNode->pPrev = pTmpLLitr;
          pNode->pHead = pLL;
        }
        // Make all nodes point to the last node in the list
        pTmpLLitr->pTail = pNode;
      }
    }
  }
  // Store pointer to the node data
  pNode->pData = pData;
}
/**
 * Removes the supplied node from the linked list and fixes links in remaining
 * nodes.
 */
void removeNode(linkListDef* pNode) {
  // Validate parameter
  if ( !pNode ) {
    // Invalid abort
    return;
  }
  if ( pNode->pPrev ) {
    // Make the node prior to this node point to the node after this
    pNode->pPrev->pNext = pNode->pNext;
  }
  if ( pNode->pHead == pNode && pNode->pNext ) {
    // This node was the head of the list, make all heads point to the next node
    for( pTmpLLitr=pNode->pHead; pTmpLLitr; pTmpLLitr=pTmpLLitr->pNext ) {
      pTmpLLitr->pHead = pNode->pNext;
    }
  }
  if ( pNode->pTail == pNode && pNode->pPrev ) {
   // This node was the last in the list, make all tails point to the previous node
    for( pTmpLLitr=pNode->pHead; pTmpLLitr; pTmpLLitr=pTmpLLitr->pNext ) {
      pTmpLLitr->pTail = pNode->pPrev;
    }
  }
  if ( pNode->pNext ) {
// Make any node after this node point to the node prior to this
    pNode->pNext->pPrev = pNode->pPrev;
  }
// Make sure the node has no set list properties
  initNode(pNode);
}