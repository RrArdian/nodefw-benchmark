echo express >> results-plain.txt ;
node express.js &
autocannon -c 1024 -t30 -p 10 -j http://localhost:8090 >> results-plain.txt
pkill -f express ;
sleep 5

echo node >> results-plain.txt ;
node plainserver.js & sleep 5 ; 
autocannon -c 1024 -t30 -p 10 -j http://localhost:8000/ >> results-plain.txt
pkill -f plainserver ;
sleep 5

echo merapi >> results-pipeline.txt ;
cd merapi ;
npm run start & sleep 5 ;
cd ..; 
autocannon -c 1024 -t30 -p 10 -j http://localhost:8080/ >> results-pipeline.txt
pkill -f start ;
sleep 5

echo molecular >> results-pipeline.txt ;
cd molecular ;
npm run dev & sleep 5 ;
cd ..; 
autocannon -c 1024 -t30 -p 10 -j http://localhost:3000/greeter/hello >> results-pipeline.txt
pkill -f molecular
sleep 5

echo nestjs >> results-pipeline.txt ;
cd nestjs ;
node index.js & sleep 5 ;
cd ..; 
autocannon -c 1024 -t30 -p 10 -j http://localhost:3030 >> results-pipeline.txt