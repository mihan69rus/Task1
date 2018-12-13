# TransYandex

## Installation
mixail@mihan69rus:~$ irb
irb(main):001:0> require 'trans_yandex'
=> true
irb(main):002:0> TransYandex::Trans.ShowAllLangs
Azerbaijani-Russian
Belarusian-Bulgarian
Belarusian-Czech
    ...
Ukrainian-Russian
Ukrainian-Serbian
Ukrainian-Turkish
=> 0
irb(main):003:0> TransYandex::Trans.ShowAllLangs('ru')
Азербайджанский-Русский
Белорусский-Болгарский
Белорусский-Чешский
    ...
Украинский-Русский
Украинский-Сербский
Украинский-Турецкий
=> 0
irb(main):004:0> TransYandex::Trans.FindTrans('ru')
=> true
irb(main):005:0> TransYandex::Trans.FindTrans('fr')
=> true
irb(main):006:0> TransYandex::Trans.FindTrans('xz')
=> false
irb(main):007:0> TransYandex::Trans.FindTrans('zx')
=> false
irb(main):008:0> TransYandex::Trans.FindTrans('zxsadlk')
=> false
irb(main):009:0> TransYandex::Trans.FindTrans('Русский')
=> true
irb(main):010:0> TransYandex::Trans.FindTrans('Французский')
=> true
irb(main):011:0> TransYandex::Trans.FindTrans('French')
=> true
irb(main):012:0> TransYandex::Trans.FindTrans('Czech')
=> true
irb(main):013:0> TransYandex::Trans.Show('Czech')
Czech-Belarusian
Czech-English
Czech-Russian
Czech-Ukrainian
=> 0
irb(main):014:0> TransYandex::Trans.Show('ru')
Russian-Azerbaijani
Russian-Belarusian
    ...
Russian-Turkish
Russian-Ukrainian
=> 0
irb(main):015:0> TransYandex::Trans.Show('Украинский')
Украинский-Болгарский
Украинский-Чешский
    ...
Украинский-Сербский
Украинский-Турецкий
=> 0
irb(main):016:0> TransYandex::Trans.List
{"af"=>"Afrikaans", "am"=>"Amharic", "ar"=>"Arabic", "az"=>"Azerbaijani", "ba"=>"Bashkir", "be"=>"Belarusian", 
       ...
"vi"=>"Vietnamese", "xh"=>"Xhosa", "yi"=>"Yiddish", "zh"=>"Chinese"}
=> nil
irb(main):017:0> TransYandex::Trans.Translate
Hello, my name in Misha
=> ["Привет, мое имя Миша\n"]
irb(main):018:0> puts TransYandex::Trans.Translate
Hello, my name is Misha
Привет, Меня зовут Миша
=> nil
irb(main):019:0> puts TransYandex::Trans.Translate(STDIN,"ru-ja")
привет
こんにちは
=> nil
irb(main):020:0> puts TransYandex::Trans.Translate("hello","en-zh")
hello
=> nil
irb(main):021:0> puts TransYandex::Trans.Translate("привет","ru-zh")
嗨
=> nil
irb(main):022:0> puts TransYandex::Trans.Translate("привет","en-fr")
привет
=> nil
irb(main):023:0> puts TransYandex::Trans.Translate("hello","en-fr")
bonjour
=> nil
irb(main):024:0> puts TransYandex::Trans.Translate("hello","ensdf")
ERROR 502: Invalid parameter: lang
=> nil
irb(main):025:0> 

Add this line to your application's Gemfile:

```ruby
gem 'trans_yandex'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install trans_yandex

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/trans_yandex.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
