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
./createClass.sh Brain std::string Ideas int howManyIdeas
```

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
	std::string Ideas;
	int howManyIdeas;
 
public: 
// Constructor 
	Brain(); 
	Brain( const Brain &rhs); 
	Brain(std::string newIdeas, int newHowManyIdeas);
	~Brain(); 
	Brain& operator=( const Brain &rhs); 
//Getters 
	std::string getIdeas(); 
	int getHowManyIdeas(); 
//Setters 
	void setIdeas(std::string Ideas); 
	void setHowManyIdeas(int howManyIdeas); 
// ToString Method 
	void toString(); 
}; 
 
#endif
```
#### Brain.cpp
```c++
#include "Brain.hpp"
// Constructor initializes attributes to 0 by default 
Brain::Brain()
	: Ideas(0), howManyIdeas(0)
{

}
 
Brain::Brain( const Brain& rhs)
{
	*this = rhs;
}
 
Brain::Brain(std::string newIdeas, int newHowManyIdeas) 
	: Ideas(newIdeas), howManyIdeas(newHowManyIdeas)
{

}

Brain::~Brain()
{

}

Brain&	Brain::operator=( const Brain& rhs )
{
	return *this;
}

//Getters 
std::string Brain::getIdeas() { return Ideas; }
int Brain::getHowManyIdeas() { return howManyIdeas; }
 
//Setters 
void Brain::setIdeas(std::string newIdeas) { Ideas = newIdeas; }
void Brain::setHowManyIdeas(int newHowManyIdeas) { howManyIdeas = newHowManyIdeas; }
 
// toString 
void Brain::toString()
{
  std::cout << "Ideas : " << Ideas << std::endl; 
  std::cout << "howManyIdeas : " << howManyIdeas << std::endl; 
}
```

## It's that easy!!!