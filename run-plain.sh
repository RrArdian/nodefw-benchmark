echo express >> results-plain.txt ;
node express.js &
autocannon -c 1024 -t30 -j http://localhost:8090 >> results-plain.txt
pkill -f express ;
sleep 5

echo node >> results-plain.txt ;
node plainserver.js & sleep 5 ; 
autocannon -c 1024 -t30 -j http://localhost:8000/ >> results-plain.txt
pkill -f plainserver ;
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
autocannon -c 1024 -t30 -j http://localhost:3030/greeter/hello >> results-plain.txt
pkill -f molecular
sleep 5

echo nestjs >> results-plain.txt ;
cd nestjs ;
node index.js & sleep 5 ;
cd ..; 
autocannon -c 1024 -t30 -j http://localhost:3000 >> results-plain.txt