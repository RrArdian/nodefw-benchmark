echo express >> results-plain.txt
node express.js &
autocannon -c 1024 -t30 -j http://localhost:8090 >> results-plain.txt
kill -9 $(lsof -t -i:8090 -sTCP:LISTEN)
sleep 5

echo node >> results-plain.txt
node plainserver.js & sleep 5
autocannon -c 1024 -t30 -j http://localhost:8000/ >> results-plain.txt
kill -9 $(lsof -t -i:8000 -sTCP:LISTEN)
sleep 5

echo merapi >> results-plain.txt
cd merapi
npm run start & sleep 5
cd ..;
autocannon -c 1024 -t30 -j http://localhost:8080/ >> results-plain.txt
kill -9 $(lsof -t -i:8080 -sTCP:LISTEN)
sleep 5

echo molecular >> results-plain.txt
cd molecular
npm run dev & sleep 5
cd ..
autocannon -c 1024 -t30 -j http://localhost:3030/greeter/hello >> results-plain.txt
kill -9 $(lsof -t -i:3030 -sTCP:LISTEN)
sleep 5

echo loopback 2 >> results-plain.txt
cd loopback
node . & sleep 5
cd ..
autocannon -c 1024 -t30 -j http://localhost:3040 >> results-plain.txt
kill -9 $(lsof -t -i:3040 -sTCP:LISTEN)
sleep 5

echo loopback 3 >> results-plain.txt
cd loopbacknew
node . & sleep 5
cd ..
autocannon -c 1024 -t30 -j http://localhost:3050 >> results-plain.txt
kill -9 $(lsof -t -i:3050 -sTCP:LISTEN)
sleep 5

echo nestjs >> results-plain.txt
cd kioson
npm run start:prod & sleep 5
cd ..
autocannon -c 1024 -t30 -j http://localhost:3000 >> results-plain.txt
kill -9 $(lsof -t -i:3000 -sTCP:LISTEN)
sleep 5