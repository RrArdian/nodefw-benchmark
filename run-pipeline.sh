echo express >> results-pipeline.txt ;
node expressserver.js &
autocannon -c 1024 -t30 -p 10 -j http://localhost:8090 >> results-pipeline.txt
pkill -f expressserver ;
sleep 5

echo node >> results-pipeline.txt ;
node rawnodeserver.js & sleep 5 ; 
autocannon -c 1024 -t30 -p 10 -j http://localhost:8000/ >> results-pipeline.txt
pkill -f rawnodeserver ;
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
npm run start & sleep 5 ;
cd ..; 
autocannon -c 1024 -t30 -p 10 -j http://localhost:3030 >> results-pipeline.txt