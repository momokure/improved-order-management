class PrefectureCode < ActiveHash::Base

  self.data = [
    {id: 1, name: '🚚北海道', name_text:'北海道'}, {id: 2, name: '🚚青森県', name_text:'青森県'}, {id: 3, name: '岩手県', name_text:'岩手県'},
    {id: 4, name: '宮城県', name_text:'宮城県'}, {id: 5, name: '秋田県', name_text:'秋田県'}, {id: 6, name: '山形県', name_text:'山形県'},
    {id: 7, name: '福島県', name_text:'福島県'}, {id: 8, name: '茨城県', name_text:'茨城県'}, {id: 9, name: '栃木県', name_text:'栃木県'},
    {id: 10, name: '群馬県', name_text:'群馬県'}, {id: 11, name: '埼玉県', name_text:'埼玉県'}, {id: 12, name: '千葉県', name_text:'千葉県'},
    {id: 13, name: '東京都', name_text:'東京都'}, {id: 14, name: '神奈川県', name_text:'神奈川県'}, {id: 15, name: '新潟県', name_text:''},
    {id: 16, name: '富山県', name_text:'富山県'}, {id: 17, name: '石川県', name_text:'石川県'}, {id: 18, name: '福井県', name_text:'福井県'},
    {id: 19, name: '山梨県', name_text:'山梨県'}, {id: 20, name: '長野県', name_text:'長野県'}, {id: 21, name: '岐阜県', name_text:'岐阜県'},
    {id: 22, name: '静岡県', name_text:'静岡県'}, {id: 23, name: '愛知県', name_text:'愛知県'}, {id: 24, name: '三重県', name_text:'三重県'},
    {id: 25, name: '滋賀県', name_text:'滋賀県'}, {id: 26, name: '京都府', name_text:'京都府'}, {id: 27, name: '大阪府', name_text:'大阪府'},
    {id: 28, name: '🚚兵庫県', name_text:'兵庫県'}, {id: 29, name: '奈良県', name_text:'奈良県'}, {id: 30, name: '和歌山県', name_text:'和歌山県'},
    {id: 31, name: '🚚鳥取県', name_text:'鳥取県'}, {id: 32, name: '🚚島根県', name_text:'島根県'}, {id: 33, name: '🚚岡山県', name_text:'岡山県'},
    {id: 34, name: '🚚広島県', name_text:'広島県'}, {id: 35, name: '🚚山口県', name_text:'山口県'}, {id: 36, name: '🚚徳島県', name_text:'徳島県'},
    {id: 37, name: '🚚香川県', name_text:'香川県'}, {id: 38, name: '🚚愛媛県', name_text:'愛媛県'}, {id: 39, name: '🚚高知県', name_text:'高知県'},
    {id: 40, name: '🚚福岡県', name_text:'福岡県'}, {id: 41, name: '🚚佐賀県', name_text:'佐賀県'}, {id: 42, name: '🚚長崎県', name_text:'長崎県'},
    {id: 43, name: '🚚熊本県', name_text:'熊本県'}, {id: 44, name: '🚚大分県', name_text:'大分県'}, {id: 45, name: '🚚宮崎県', name_text:'宮崎県'},
    {id: 46, name: '🚚鹿児島県', name_text:'鹿児島県'}, {id: 47, name: '✈️沖縄県', name_text:'️沖縄県'}, {id: 48, name: '不明', name_text:'不明'},
    {id: 49, name: '直接お受け渡し', name_text:'直接'}
  ]

  include ActiveHash::Associations
  has_many :customer_addresses
  has_many :order_addresses
end