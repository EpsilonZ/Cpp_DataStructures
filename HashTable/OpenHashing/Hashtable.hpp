#ifndef _HASHTABLE_HPP_
#define _HASHTABLE_HPP_
#include "Hash.hpp"


#include <iostream>
using namespace std;

template <typename Key>
class Hashtable {
private:
  struct Hash_node {
    Key _k;
    Hash_node *_next;
    Hash_node(const Key &k, Hash_node *next = NULL);
  };

  Hash_node **_table;
  unsigned int _table_size;
  unsigned int _count;

  int _hash(const Key &key) const;
public:

  Hashtable();
  Hashtable(const Hashtable &h);
  Hashtable& operator=(const Hashtable &h);
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
