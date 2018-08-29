# EncryptedDiary

## Dependancies

* ruby v 2.5 or better
* rspec
* bundler/ gemfile

## Installation

simply for/ clone the repo, boot up your ide or terminal or choice and run Diary.rb in the console.
to run the rspec tests print **rspec** into cmd/terminal like so:

    Jacks-MacBook-Pro:Modularisation jackbranch$ rspec

after this expect an output like the one below:

  
    Finished in 0.04145 seconds (files took 0.14003 seconds to load)
    18 examples, 0 failures


for more infomation check out rspecs official repository or visit: https://relishapp.com/rspec

## Usage

To run the application simply open irb or any other console based ruby runner.
Then simply require the Diary.rb file and create a new Diary object. you will then be prompted to add a diary entry, do this in the console and press enter. when you are ready enter *encrypt_entries* and the program will encrypt your entries, and will inform you that your encryption keys have been saved to two files *key.txt* and *char_key.txt* . these files contain the two keys needed for decryption **do not** loose these, if you do you will **not** be able to decrypt your entries!

## Testing

This application uses two types of tests: a full program test found in *program_spec.rb* and unit tests found in all other spec files (not including *spec_helper*).
When running tests be aware that any changes will affect *program_spec* in addition to the relevent class spec file. this is because *program_spec* simulates runs of the entire program and is dependant on all core files. Therefore changing any method name or class name will require program spec to be amended.

### Have fun encrypting your diaries :)
