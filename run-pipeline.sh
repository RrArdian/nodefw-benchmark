echo express >> results-pipeline.txt
node express.js &
autocannon -c 1024 -t30 -p 10 -j http://localhost:8090 >> results-pipeline.txt
kill -9 $(lsof -t -i:8090 -sTCP:LISTEN)
sleep 5

echo node >> results-pipeline.txt
node plainserver.js & sleep 5
autocannon -c 1024 -t30 -p 10 -j http://localhost:8000/ >> results-pipeline.txt
kill -9 $(lsof -t -i:8000 -sTCP:LISTEN)
sleep 5

echo merapi >> results-pipeline.txt
cd merapi
npm run start & sleep 5
cd ..;
autocannon -c 1024 -t30 -p 10 -j http://localhost:8080/ >> results-pipeline.txt
kill -9 $(lsof -t -i:8080 -sTCP:LISTEN)
sleep 5

echo molecular >> results-pipeline.txt
cd molecular
npm run dev & sleep 5
cd ..
autocannon -c 1024 -t30 -p 10 -j http://localhost:3030/greeter/hello >> results-pipeline.txt
kill -9 $(lsof -t -i:3030 -sTCP:LISTEN)
sleep 5

echo loopback 2 >> results-pipeline.txt
cd loopback2
node . & sleep 5
cd ..
autocannon -c 1024 -t30 -p 10 -j http://localhost:3040 >> results-pipeline.txt
kill -9 $(lsof -t -i:3040 -sTCP:LISTEN)
sleep 5

echo loopback 3 >> results-pipeline.txt
cd loopback3
node . & sleep 5
cd ..
autocannon -c 1024 -t30 -p 10 -j http://localhost:3050 >> results-pipeline.txt
kill -9 $(lsof -t -i:3050 -sTCP:LISTEN)
sleep 5

echo nestjs >> results-pipeline.txt
cd nest
npm run start:prod & sleep 5
cd ..
autocannon -c 1024 -t30 -p 10 -j http://localhost:3000 >> results-pipeline.txt
kill -9 $(lsof -t -i:3000 -sTCP:LISTEN)
sleep 5


echo featherjs >> results-pipeline.txt
cd featherjs
npm run start & sleep 5
cd ..
autocannon -c 1024 -t30 -p 10 -j http://localhost:3060 >> results-pipeline.txt
kill -9 $(lsof -t -i:3060 -sTCP:LISTEN)
sleep 5

echo koa >> results-pipeline.txt
cd koa
npm run start & sleep 5
cd ..
autocannon -c 1024 -t30 -p 10 -j http://localhost:3070 >> results-pipeline.txt
kill -9 $(lsof -t -i:3070 -sTCP:LISTEN)
sleep 5