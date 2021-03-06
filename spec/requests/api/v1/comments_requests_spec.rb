require 'rails_helper'

describe "Comments API" do 
  xdescribe "creating a comment" do 
    let(:alice) { Fabricate(:user, fullname: "Alice Doe") }
    let!(:todo_list) { Fabricate(:list, user: alice) }
    let!(:card) { Fabricate(:card, list: todo_list) }

    context "with valid inputs" do 
      before do 
        sign_in(alice)
        post '/api/v1/comments', params: { comment: { payload: "This is a comment", card_id: card.id } }
      end

      it "returns a success message" do 
        expect(json['message']).not_to be_nil
      end

      it "returns the serialized comment" do 
        expect(json['comment']).not_to be_nil
      end
    end

    context "with invalid inputs" do 
      before do 
        sign_in(alice)
        set_current_user(alice)
        post '/api/v1/comments', params: { comment: { list_id: todo_list.id } }
      end

      it "returns an error message" do 
        expect(json['message']).not_to be_nil
      end
    end
    
  end
end