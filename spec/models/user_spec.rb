require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'nickname,email,password,password_confirmation,family_name,first_name,family_name_kana,first_name_kana,birthdayが存在すれば登録できること' do
      expect(@user).to be_valid
    end

    it 'nicknameが空だと保存できないこと' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("ニックネームを入力してください")
    end

    it 'emailが空だと保存できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("メールアドレスを入力してください")
    end

    it '同じemailが存在している場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('メールアドレスはすでに存在します')
    end

    it 'passwordが空だと保存できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください")
    end

    it 'passwordが存在してもpassword_confirmationがないと保存できない' do
      @user.password = '123asd'
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end

    it 'passwordが5文字以下では保存できないこと、passwordが英数字でない場合は保存できないこと' do
      @user.password = '123'
      # @user.password_confirmation = "123"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
    end

    it 'family_nameが空だと保存できないこと' do
      @user.family_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("苗字を入力してください")
    end

    it 'family_nameが全角でない場合保存できないこと' do
      @user.family_name = 'ｱﾍﾞ'
      @user.valid?
      expect(@user.errors.full_messages).to include('苗字は全角で入力してください')
    end

    it 'first_nameが空だと保存できないこと' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("名前を入力してください")
    end

    it 'first_nameが全角でないと保存できないこと' do
      @user.first_name = 'ｱ'
      @user.valid?
      expect(@user.errors.full_messages).to include('名前は全角で入力してください')
    end

    it 'family_name_kanaが空だと保存できないこと' do
      @user.family_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("苗字は全角カタカナで入力してください")
    end

    it 'family_name_kanaが全角でないと保存できないこと' do
      @user.family_name_kana = 'ｱﾍﾞ'
      @user.valid?
      expect(@user.errors.full_messages).to include('苗字は全角カタカナで入力してください')
    end

    it 'first_name_kanaがないと保存できないこと' do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("名前は全角カタカナで入力してください")
    end

    it 'first_name_kanaが全角でないと保存できないこと' do
      @user.first_name_kana = 'ﾀﾛｳ'
      @user.valid?
      expect(@user.errors.full_messages).to include('名前は全角カタカナで入力してください')
    end

    it 'birthdayが空だと保存できないこと' do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("誕生日を入力してください")
    end

    it 'emailが@を含んでいる場合保存できること' do
      @user.email = 'test@test.com'
      @user.valid?
      expect(@user).to be_valid
    end

    it 'passwordが英数字であれば保存できること' do
      @user.password = '123abc'
      @user.password_confirmation = '123abc'
      @user.valid?
      expect(@user).to be_valid
    end

    it 'passwordが6文字以上なら保存できること' do
      @user.password = '123abc'
      @user.password_confirmation = '123abc'
      @user.valid?
      expect(@user).to be_valid
    end

    it 'family_nameが全角であれば保存できること' do
      @user.family_name = '阿部'
      @user.valid?
      expect(@user).to be_valid
    end

    it 'first_nameが全角であれば保存できること' do
      @user.first_name = '太郎'
      @user.valid?
      expect(@user).to be_valid
    end

    it 'family_name_kanaが全角カタカナであれば保存できること' do
      @user.family_name_kana = 'アベ'
      @user.valid?
      expect(@user).to be_valid
    end

    it 'first_name_kanaが全角カタカナであれば保存できること' do
      @user.first_name_kana = 'タロウ'
      @user.valid?
      expect(@user).to be_valid
    end
  end
end
