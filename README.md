# Checking Flybuys Card 

## Environment
- ruby 3.1.2

## Run the program
```
git clone git@github.com:cloudy9101/flybuys_card_validation.git
cd flybuys_card_validation
./bin/run "60141016700078611
6014152705006141
6014111100033006
6014709045001234
6014352700000140
6014355526000020
6014 3555 2900 0028
6013111111111111"

# OUTPUT
Fly Buys Black: 60141016700078611 (valid)
Fly Buys Black: 6014152705006141 (invalid)
Fly Buys Black: 6014111100033006 (valid)
Fly Buys Blue: 6014709045001234 (valid)
Fly Buys Red: 6014352700000140 (valid)
Fly Buys Green: 6014355526000020 (valid)
Fly Buys Green: 6014355526000028 (invalid)
Unknown: 6013111111111111 (invalid)
```

## Test the program
```
rake test
```
