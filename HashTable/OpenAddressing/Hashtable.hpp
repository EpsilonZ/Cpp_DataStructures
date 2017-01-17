#ifndef _HASHTABLE_HPP_
#define _HASHTABLE_HPP_

#include <iostream>
using namespace std;

template <typename Key>
class Hashtable {
private:
  enum Estat {lliure, esborrat, ocupat};
  struct Hash_node {
    Key _k;
    Estat _est;
    Hash_node();
  };

  Hash_node *_table;
  unsigned int _table_size;
  unsigned int _count;

  int _hash(const Key &key) const;
  void _delete();
  void _copy(Hash_node *p_table);
  int _find(const Key &k) const;
public:

  /*
    @Init()
    @params
    @discussion Create a new hashtable with a default table size;
    @return
  */
  Hashtable();

  /*
    @Init(h : Hashtable)
    @params h : Hashtable
    @discussion Create a copy from h
    @return
  */
  Hashtable(const Hashtable &h);

  /*
    @Operator=(h : Hashtable)
    @params h : Hashtable
    @discussion Create a copy from h if anything goes wrong. If it's, restore the hashtable.
    @return Pointer to the hashtable with values copied.
  */
  Hashtable& operator=(const Hashtable &h);

  /*
    @Destructor
    @params
    @discussion Destroy the hashtable and free the dynamic memory
    @return
  */
  ~Hashtable();


  /*
    @contains
    @params
    @discussion find in hashtable the element where key = k
    @return The value if element exists, NULL otherwise.
  */
  bool contains(const Key &k) const;

  /*
    @insert
    @params
    @discussion Insert a new element where elem._k = k
    @return void
  */

  void insert(const Key &k);

  /*
    @remove
    @params
    @discussion Remove the element if exists where key = k, otherwise nothing happens
    @return void
  */
  void remove(const Key &k);

  /*
    @print
    @params
    @discussion Print the hashtable
    @return void
  */
  void print_hash(std::ostream &os) const;

  /*
    @count
    @params
    @discussion
    @return the number of elements in hashtable
  */
  int count() const;

};

#include "Hashtable.t"
#endif
