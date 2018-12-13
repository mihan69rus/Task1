require "trans_yandex/version"
require 'json'
require 'net/http'

module TransYandex
 
  BUFFER = 1024
  OK = 200
  KEY = "trnsl.1.1.20181212T143009Z.ba68593afa9a78b7.3f"\
       "099f8e713377cf41e5d93e9106bae040cc2ec9&"
protected

  class Client

    def initialize
      @host = "https://translate.yandex.net/api/v1.5/tr.json/"
      @detect = "detect?key="
      @get_langs = "getLangs?key="
      @trans = "translate?key="
    end

    def GetLangs(ui)
      @uri = @host + @get_langs + KEY + "ui=" + ui
      @resp = Net::HTTP.get_response(URI.parse(@uri))
      @parserresp = JSON.parse(@resp.body)
      @parserresp
    end

    def Translate(text,lang = "ru")
      @uri = @host + @trans + KEY + "lang=" + lang + "&options=1"
      param = {"text" => text}
      @resp = Net::HTTP.post_form(URI.parse(@uri),param)
      @parserresp = JSON.parse(@resp.body)
      @parserresp
    end

    def Detect(text)
      @uri = @host + @detect + KEY + "hint=en,ru"
      param = {"text" => text}
      @resp = Net::HTTP.post_form(URI.parse(@uri),param)
      @parserresp = JSON.parse(@resp.body)
      @parserresp
    end
  end

public

  class Trans

    @yand = Client.new

    def self.ShowAllLangs(lang = "en")
      info = @yand.GetLangs(lang)
      0.upto(info['dirs'].length-1) do |x| 
        lang1 = info['dirs'][x][0..1]
        lang2 = info['dirs'][x][3..4]
        puts info['langs'][lang1] + "-" + info['langs'][lang2]
      end
    end

    def self.FindTrans(lang)
      info = @yand.GetLangs(@yand.Detect(lang)['lang'])
      0.upto(info['dirs'].length-1) do |x| 
        test1 = info['dirs'][x][0..1]
        test2 = info['dirs'][x][3..4]
        test3 = info['langs'][test2]
        test4 = info['langs'][test1]
        if lang == test2 || lang == test1 || lang == test3 || lang == test4
          return true
        end
      end
      return false
    end

    def self.Show(lang)
      info = @yand.GetLangs(@yand.Detect(lang)['lang'])
      0.upto(info['dirs'].length-1) do |x| 
        test1 = info['dirs'][x][0..1]
        test2 = info['dirs'][x][3..4]
        test3 = info['langs'][test1]
        if lang == test3 || lang == test1 
          puts info['langs'][test1] + "-" + info['langs'][test2]
        end
      end
    end

    def self.List
      puts @yand.GetLangs("en")['langs']
    end

    def self.Translate(reader=STDIN, lang="ru")
      msg = self.Read(reader)
      info = @yand.Translate(msg,lang)
      if info['code'] != OK
        "ERROR " + info['code'].to_s + ": " + info['message']
      else
        info['text']
      end
    end

    protected

    def self.Read(reader = STDIN)
      if reader.class == String
        reader
      elsif reader.class == IO
          reader.gets(BUFFER)
      end
    end
  end
end
