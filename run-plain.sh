echo express >> results-plain.txt ;
node expressserver.js &
autocannon -c 1024 -t30 -j http://localhost:8090 >> results-plain.txt
pkill -f expressserver ;
sleep 5

echo node >> results-plain.txt ;
node rawnodeserver.js & sleep 5 ; 
autocannon -c 1024 -t30 -j http://localhost:8000/ >> results-plain.txt
pkill -f rawnodeserver ;
sleep 5

echo merapi >> results-plain.txt ;
cd merapi ;
npm run start & sleep 5 ;
cd ..; 
autocannon -c 1024 -t30 -j http://localhost:8080/ >> results-plain.txt
pkill -f start ;
sleep 5

echo molecular >> results-plain.txt ;
cd molecular ;
npm run dev & sleep 5 ;
cd ..; 
autocannon -c 1024 -t30 -j http://localhost:3000/greeter/hello >> results-plain.txt
pkill -f molecular
sleep 5

echo nestjs >> results-plain.txt ;
cd nestjs ;
npm run start & sleep 5 ;
cd ..; 
autocannon -c 1024 -t30 -j http://localhost:3030 >> results-plain.txt