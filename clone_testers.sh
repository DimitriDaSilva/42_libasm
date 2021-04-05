git clone https://github.com/Tripouille/libasmTester tester_tripouille
git clone https://github.com/mli42/mlibasm_tester tester_mli42

make -C tester_tripouille
cd tester_mli42 && ./do.sh && cd ..
