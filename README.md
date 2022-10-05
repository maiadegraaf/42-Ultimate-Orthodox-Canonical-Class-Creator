# Ultimate Orthodox Canonical Class Creator

Are you fed up with setting up two files with Orthodox Canonical Class every time you create a new class? Are you tired of copy pasting your entire header file and manually changing the class name and variables?  Are you sick of remaking all the same functions time and time again? 

### Then the Ultimate Orthodox Canonical Class Creator is for you!

## Here's how it works

### Clone the Repository
```
git clone https://github.com/maiadegraaf/42-Ultimate-Orthodox-Canonical-Class-Creator.git
cd 42-Ultimate-Orthodox-Canonical-Class-Creator
```

### Run the file!
Like so:
```
./createClass.sh <class name> <type 1> <variable 1> <type 2> <variable 2> ....
```

For example:
```
./createClass.sh Brain std::string owner int numTimesHitInTheHead int remainingBrainCells 
```
\**Remember to use `std::string` instead of `string` as we aren't allowed to use namespaces at 42*

Creates two file's that look like this:
#### Brain.hpp
```C++
#ifndef BRAIN_H
#define BRAIN_H
#include <iostream>
#include <string>
 
// Class definition 
class Brain
{
private: 
	std::string _owner;
	int _numTimesHitInTheHead;
	int _remainingBrainCells;
 
public: 
// Constructor 
	Brain(); 
	Brain( const Brain &rhs); 
	Brain(std::string newOwner, int newNumTimesHitInTheHead, int newRemainingBrainCells);
	~Brain(); 
	Brain& operator=( const Brain &rhs); 
// Getters 
	std::string getOwner(); 
	int getNumTimesHitInTheHead(); 
	int getRemainingBrainCells(); 
// Setters 
	void setOwner(std::string _owner); 
	void setNumTimesHitInTheHead(int _numTimesHitInTheHead); 
	void setRemainingBrainCells(int _remainingBrainCells); 
// Output 
	void output(); 
}; 
 
#endif
```
#### Brain.cpp
```c++
#include "Brain.hpp"
// Constructor initializes attributes to 0 by default 
Brain::Brain()
	: _owner(0), _numTimesHitInTheHead(0), _remainingBrainCells(0)
{

}
 
Brain::Brain( const Brain& rhs)
{
	*this = rhs;
}
 
Brain::Brain(std::string newOwner, int newNumTimesHitInTheHead, int newRemainingBrainCells) 
	: _owner(newOwner), _numTimesHitInTheHead(newNumTimesHitInTheHead), _remainingBrainCells(newRemainingBrainCells)
{

}

Brain::~Brain()
{

}

Brain&	Brain::operator=( const Brain& rhs )
{
	return *this;
}

// Getters 
std::string Brain::getOwner() { return _owner; }
int Brain::getNumTimesHitInTheHead() { return _numTimesHitInTheHead; }
int Brain::getRemainingBrainCells() { return _remainingBrainCells; }
 
// Setters 
void Brain::setOwner(std::string newOwner) { _owner = newOwner; }
void Brain::setNumTimesHitInTheHead(int newNumTimesHitInTheHead) { _numTimesHitInTheHead = newNumTimesHitInTheHead; }
void Brain::setRemainingBrainCells(int newRemainingBrainCells) { _remainingBrainCells = newRemainingBrainCells; }
 
// Output
void Brain::output()
{
  std::cout << "owner : " << _owner << std::endl; 
  std::cout << "numTimesHitInTheHead : " << _numTimesHitInTheHead << std::endl; 
  std::cout << "remainingBrainCells : " << _remainingBrainCells << std::endl; 
}
```

### It's that easy!!!