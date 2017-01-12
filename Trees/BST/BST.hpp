#ifndef _BST_HPP_
#define _BST_HPP_

template <typename T>
class BST {

private:
  struct BST_Node {
    T data;
    BST_Node *right;
    BST_Node *left;
  };

  BST_Node *_root;
  int _size;
  
public:

  BST();
  BST(const BST &tree);
  BST& operator=(const BST &tree);
  ~BST();

  int size() const;
  void insert(T data);

  /* Iterator */
  friend class iterator;
  class iterator {
    friend class BST;

  public:
    iterator();
    iterator(const iterator &it);
    iterator& operator=(const iterator &t);
    ~iterator();

    T operator*() const;
    iterator left() const;
    iterator right() const;
    operator bool() const;

  private:
    BST<T>::BST_Node *_root;
  };
  /* End iterator */
};

#include "BST.t"
#endif
