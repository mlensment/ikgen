# Estonian Identity Code generator
This gem generates valid Estonian male and female identity codes, birth year between 1950 - 1999. This means that the generated person will always be an adult (18+).

## Requirements
You need ruby to run this script. Tested with ruby ```2.4.1```.

## Installation
```
cd ~/your-preferred-directory
git clone git@github.com:mlensment/ikgen.git
```

## Usage
```
ruby ik.rb
```

## Bonus
Additionally you may create an alias and add it to your `.bashrc` / `.zshrc`  
```
echo 'alias ikgen="ruby ~/your-preferred-directory/ikgen/ik.rb"' >> ~/.zshrc
source ~/.zshrc
ikgen
```
