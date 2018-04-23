/*Build an array for "string" elements [check
"array" and "string" on Processing reference*/
String[] mytext;

/*Now the array is populated with the lines
of my external file "text.txt".*/
mytext=loadStrings("text.txt");

//We need to know the lines number.
int lines=mytext.length;

//Print this number on the consolle.
println("This text contains " + lines + " lines.");

//Just some space.
println(" ");

//Print on the consolle all the items of my array.
for(int a=0;a<lines;a++){
println(mytext[a]);
}
