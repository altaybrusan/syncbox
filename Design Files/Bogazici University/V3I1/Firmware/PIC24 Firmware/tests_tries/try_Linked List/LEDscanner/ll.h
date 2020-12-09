/**
 * File:
 *  ll.h
 *
 * Notes:
 *  This file contains the prototypes and datatype definitions for a generic
 *  linked list.
 *
 * Structure:
 *  linkListDef, this type is used for linked list and each node in the list
 *
 * Members:
 *  pData, pointer to the data to store with this node
 *  pHead, pointer to the first node in the linked list
 *  pNext, pointer to the next node in the linked list
 *  pPrev, pointer to the previous node in the linked list
 *  pTail, pointer to the last node in the linked list
 *
 * Functions:
 *  addNode     - Adds a node to the linked list
 *  removeNode  - Removes a node from the linked list
 *
 * History:
 *  17/01/2013 Written by Simon Platten
 */
#ifndef LINKLIST_H
  #define LINKLIST_H
// Generic link list node definition
  typedef struct _llnode {
    void* pData;                    // Pointer to data to store with this node
// Navigational references
    struct _llnode* pHead;          // Pointer to first node in list
    struct _llnode* pNext;          // Pointer to next node in list
    struct _llnode* pPrev;          // Pointer to previous node in list
    struct _llnode* pTail;          // Pointer to last node in list
  } linkListDef;
// Prototypes
  void addNode(linkListDef* pLL, linkListDef* pNode, void* pData);
  void removeNode(linkListDef* pNode);
#endif