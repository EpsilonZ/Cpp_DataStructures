#include <iostream>
#include "Hashtable.hpp"
using namespace std;

int main() {
  Hashtable<int> hashtable;
  hashtable.insert(14);
  hashtable.insert(34);
  hashtable.print_hash(cout);
  cout<<endl;
  hashtable.remove(35);
  hashtable.remove(34);
  hashtable.print_hash(cout);

  cout<<hashtable.contains(34)<<endl;
  cout<<hashtable.contains(14)<<endl;
  return  0;
}
