require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
      context '新規登録できるとき' do
        it 'nicknameとemail、passwordとpassword_confirmation、last_nameとfirst_name、last_name_kanaとfirst_name_kana、birthdayが存在すれば登録できる' do
          expect(@user).to be_valid
        end
        it 'passwordが6文字以上であれば登録できる' do
          @user.password = '123abc'
          @user.password_confirmation = '123abc'
          expect(@user).to be_valid
        end
      end

      context '新規登録できないとき' do
        it 'nicknameが空では登録できない' do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("ニックネームが空では登録できない")
        end
        it 'emailが空では登録できない' do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("メールアドレスが空では登録できない")
        end
        it 'passwordが空では登録できない' do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("パスワードが空では登録できない")
        end
        it 'last_nameが空では登録できない' do
          @user.last_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("苗字が空では登録できない")
        end
        it 'first_nameが空では登録できない' do
          @user.first_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("名前が空では登録できない")
        end
        it 'last_name_kanaが空では登録できない' do
          @user.last_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("苗字（カタカナ）が空では登録できない")
        end
        it 'first_name_kanaが空では登録できない' do
          @user.first_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("名前（カタカナ）が空では登録できない")
        end
        it 'birthdayが空では登録できない' do
          @user.birthday = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("生年月日が空では登録できない")
        end
        it 'last_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
          @user.last_name = 'aaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include('苗字が全角（漢字・ひらがな・カタカナ）でなければ登録できない')
        end
        it 'first_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
          @user.first_name = 'aaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include('名前が全角（漢字・ひらがな・カタカナ）でなければ登録できない')
        end
        it 'last_name_kanaが全角（カタカナ）でなければ登録できない' do
          @user.last_name_kana = 'aaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include('苗字（カタカナ）が全角（カタカナ）でなければ登録できない')
        end
        it 'first_name_kanaが全角（カタカナ）でなければ登録できない' do
          @user.first_name_kana = 'aaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include('名前（カタカナ）が全角（カタカナ）でなければ登録できない')
        end
        it 'passwordが5文字以下であれば登録できない' do
          @user.password = 'abc12'
          @user.password_confirmation = 'abc12'
          @user.valid?
          expect(@user.errors.full_messages).to include('パスワードが5文字以下であれば登録できない')
        end
        it 'passwordとpassword_confirmationが不一致では登録できない' do
          @user.password = '123abc'
          @user.password_confirmation = '123abcd'
          @user.valid?
          expect(@user.errors.full_messages).to include("パスワードとパスワード再入力が不一致では登録できない")
        end
        it 'passwordは数字のみは登録できない' do
          @user.password = '123456'
          @user.password_confirmation = '123456'
          @user.valid?
          expect(@user.errors.full_messages).to include('パスワードは数字のみは登録できない')
        end
        it 'passwordは半角英語のみは登録できない' do
          @user.password = 'aaaaaa'
          @user.password_confirmation = 'aaaaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include('パスワードは半角英語のみは登録できない')
        end
        it 'passwordは全角英数混合は登録できない' do
          @user.password = '１２３ＡＢＣ'
          @user.password_confirmation = '１２３ＡＢＣ'
          @user.valid?
          expect(@user.errors.full_messages).to include('パスワードは全角英数混合は登録できない')
        end
        it 'emailは@がない場合は登録できない' do
          @user.email = 'aaaaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include('メールアドレスは@がない場合は登録できない')
        end
        it '重複したemailが存在する場合登録できない' do
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.valid?
          expect(another_user.errors.full_messages).to include('重複したメールアドレスが存在する場合登録できない')
        end
      end
    end
  end
end
