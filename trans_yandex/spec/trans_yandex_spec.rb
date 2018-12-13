RSpec.describe TransYandex do

  it "has a version number" do
    expect(TransYandex::VERSION).not_to be nil
  end

  it "find 'de' in list" do
    expect(TransYandex::Trans.FindTrans("de")).to eq(true)
  end

  it "don't 'skdj' in list" do
    expect(TransYandex::Trans.FindTrans("skdj")).to eq(false)
  end

  it "translate 'friend'" do
    expect(TransYandex::Trans.Translate("friend")).to eq("друг")
  end

#  it "does something useful" do
#    expect(false).to eq(true)
#  end
end
