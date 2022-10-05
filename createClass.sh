uppercaseName=$(printf '%s' "$1" | tr "a-z" "A-Z" )

echo "#ifndef ${uppercaseName}_H" > $1.hpp
echo "#define ${uppercaseName}_H" >> $1.hpp

echo "#include <iostream>" >> $1.hpp
echo "#include <string>" >> $1.hpp

echo " " >> $1.hpp

echo "// Class definition " >> $1.hpp

echo "class $1\n{" >> $1.hpp

printf "private: \n" >> $1.hpp
c=1
for i in "${@:2}"; do
    if [ $((c%2)) -eq 0 ] 
    then
        echo "$i;" >> $1.hpp
    else
        printf "\t$i " >> $1.hpp
    fi
    c=$((c+1))
done
echo " " >> $1.hpp
printf "public: \n" >> $1.hpp
echo "// Constructor " >> $1.hpp
printf "\t$1(); \n" >> $1.hpp
printf "\t$1( const $1 &rhs); \n" >> $1.hpp
if [ $# -gt 2 ]
then
	printf "\t$1(" >> $1.hpp
	for i in "${@:2}"; do
		if [ $((c%2)) -eq 0 ]
		then
			j="$(tr "a-z" "A-Z" <<< ${i:0:1})${i:1}"
			printf "${prev} new$j" >> $1.hpp
			if [ $i != ${!#} ]
			then
				printf ", " >> $1.hpp
			else
				printf ");\n" >> $1.hpp
			fi
		else
			prev=$i
		fi
		c=$((c+1))
	done
fi
printf "\t~$1(); \n" >> $1.hpp
printf "\t$1& operator=( const $1 &rhs); \n" >> $1.hpp

echo "//Getters " >> $1.hpp
for i in "${@:2}"; do
    if [ $((c%2)) -eq 0 ] 
    then
		j="$(tr "a-z" "A-Z" <<< ${i:0:1})${i:1}"
        echo "$j(); " >> $1.hpp
    else
        printf "\t$i get" >> $1.hpp
    fi
    c=$((c+1))
done

echo "//Setters " >> $1.hpp
for i in "${@:2}"; do
    if [ $((c%2)) -eq 0 ] 
    then
		j="$(tr "a-z" "A-Z" <<< ${i:0:1})${i:1}"
        printf "\tvoid set$j(${prev} $i); \n" >> $1.hpp

    else
        
        prev=$i
        
    fi
    c=$((c+1))
done
echo "// ToString Method " >> $1.hpp
printf "\tvoid toString(); \n" >> $1.hpp

echo "}; " >> $1.hpp

echo " " >> $1.hpp

echo "#endif" >> $1.hpp

echo "#include \"$1.hpp\"" >> $1.cpp

echo "// Constructor initializes attributes to 0 by default " >> $1.cpp
echo "$1::$1()" >> $1.cpp
printf "\t: " >> $1.cpp
for i in "${@:2}"; do
    if [ $((c%2)) -eq 0 ] 
    then
        printf "$i(0)" >> $1.cpp
		if [ $i != ${!#} ]
		then
			printf ", " >> $1.cpp
		fi
    fi
    c=$((c+1))
done

echo "\n{\n\n}" >> $1.cpp

echo " " >> $1.cpp

echo "$1::$1( const $1& rhs)" >> $1.cpp
echo "{" >> $1.cpp
echo "\t*this = rhs;" >> $1.cpp
echo "}" >> $1.cpp

echo " " >> $1.cpp

if [ $# -gt 2 ]
	then
		printf "$1::$1(" >> $1.cpp
		for i in "${@:2}"; do
			if [ $((c%2)) -eq 0 ]
			then
				j="$(tr "a-z" "A-Z" <<< ${i:0:1})${i:1}"
				printf "${prev} new$j" >> $1.cpp
				if [ $i != ${!#} ]
				then
					printf ", " >> $1.cpp
				else
					printf ") \n\t: " >> $1.cpp
				fi
			else
				prev=$i
			fi
			c=$((c+1))
		done
		for i in "${@:2}"; do
			if [ $((c%2)) -eq 0 ]
			then
				j="$(tr "a-z" "A-Z" <<< ${i:0:1})${i:1}"
				printf "$i(new$j)" >> $1.cpp
				if [ $i != ${!#} ]
				then
					printf ", " >> $1.cpp
				else
					printf "\n{\n\n}\n\n" >> $1.cpp
				fi
			else
				prev=$i
			fi
			c=$((c+1))
		done
fi

echo "$1::~$1()\n{" >> $1.cpp
echo "" >> $1.cpp
echo "}\n" >> $1.cpp

echo "$1&\t$1::operator=( const $1& rhs )\n{" >> $1.cpp
echo "\treturn *this;" >> $1.cpp
echo "}\n" >> $1.cpp

echo "//Getters " >> $1.cpp
for i in "${@:2}"; do
    if [ $((c%2)) -eq 0 ] 
    then
		j="$(tr "a-z" "A-Z" <<< ${i:0:1})${i:1}"
        echo "$prev $1::get$j() { return $i; }" >> $1.cpp
        

    else
        
        prev=$i
    fi
    c=$((c+1))
done

echo " " >> $1.cpp
echo "//Setters " >> $1.cpp
for i in "${@:2}"; do
    if [ $((c%2)) -eq 0 ] 
    then
		j="$(tr "a-z" "A-Z" <<< ${i:0:1})${i:1}"
        echo "void $1::set$j($prev new$j) { $i = new$j; }" >> $1.cpp

    else
        
        prev=$i
    fi
    c=$((c+1))
done

echo " " >> $1.cpp
echo "// toString " >> $1.cpp
echo "void $1::toString()\n{" >> $1.cpp

for i in "${@:2}"; do
    if [ $((c%2)) -eq 0 ] 
    then
        echo "  std::cout << \"$i : \" << $i << std::endl; " >> $1.cpp
    fi
    c=$((c+1))
done

echo "}" >> $1.cpp

echo " " >> $1.cpp

