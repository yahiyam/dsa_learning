//[ 20, 35, 40, 10, 22, 32, 19]
/* 
init 
set       add value by replacing another value
get
traverse
insert    add new space and value
delete
 */
//declaration and initialisation
void main(List<String> args) {
  List list; //declaration
  list = [1, 2]; //initialisatoin  ==> O(n)ST
  print(list);
  list[0] = 2;   //set             ==> O(1)ST 
  print(list);
}
//dynamic list && static list
//dynamic list    worst case ==> O(n)ST   best case ==> O(1)ST
// array is a back to back memory space