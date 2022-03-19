# log_parser_master
![](public/ruby_version.svg)
![](public/rubocop.svg)
![](public/coverage.svg)

This is Ruby application help to you for process Log file with some structure,In this project we need to calculate count of visitors and unique views from log file.For now we supported one structure of file but it is extensible for other log file structure.This structure is space separator between page url and Ip in each line, line sample :/home 127.0.0.0 

# Getting Start 
Although this program might work on older ruby versions,It has been developed using Ruby 2.7.0

To get started with the app, first clone the repository and cd into the directory:

```
$ git clone https://github.com/farzanenalidadi/log_parser.git 
$ cd log_parser
```
Then install the needed gems

```
$ bundle install 
```

Run from command line,You should go to log_parser directory

```
 ./parser.rb public/webserver.log 
```
If you need more information run the command with --help

``` 
./parser.rb --help
```

# LogParser Test
For Run test you should run the command with `rspec` and you can see test coverage in test result 

For run Rubocop(static code analyzer) you should run the command with `rubocop`

# LogParser Structure
* First step : Entrypoint Add Log file name as argument for example `parser.rb`
* Second step: `LogParserBuilder` receive filename form the entrypoint and this class take an instance from `LogParser` and this class injecting all dependency such sorter and formatter to parser class.

* third step: `LogParser` give type of parser and formatter and sorter then generate report,
 For example we use type `SpaceSeparatedParser` for parse log file and  then generate hash with count of visits and use `Set` class for keep unique Ip for calculate unique views. We create two type of sorter `VisitsSorter` ,`UniqueVisitSorter` for sort hash data.Finally use a formatter `PlainTextFormater` to format output and print log report.

# Roadmap 
* Docker Base Should be better for reduce dependency in local test, such `Ruby`  
* The better way to read and parse file in ruby use from `CSV` gem and this gem have lots of method is easy to use for parse file.
* The `Daru`(Data Analysis in RUby) gem is a library for analysis, manipulation and visualization of data and is better to use instead of formater class.
* The parsing, sorting and formatting class could be a little simpler and sorter class can have sort order (ASC/DES).
* Exception handling could be improved, especially by introducing custom exception classes into the code.
* For large scale you should use data store structure such `Redis` to eliminate the dependency on a specific hash structure.



