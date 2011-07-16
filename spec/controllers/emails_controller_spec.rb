require 'spec_helper'

describe EmailsController do
  
  login_user
  
  def valid_attributes
    { :email => 'rubinho@desafiorails.com.br' }
  end

  describe "GET index" do
    it "assigns all emails as @emails" do
      email = Email.create! valid_attributes
      get :index
      assigns(:emails).should eq([email])
    end
  end

  describe "GET show" do
    it "assigns the requested email as @email" do
      email = Email.create! valid_attributes
      get :show, :id => email.id.to_s
      assigns(:email).should eq(email)
    end
  end

  describe "GET new" do
    it "assigns a new email as @email" do
      get :new
      assigns(:email).should be_a_new(Email)
    end
  end

  describe "GET edit" do
    it "assigns the requested email as @email" do
      email = Email.create! valid_attributes
      get :edit, :id => email.id.to_s
      assigns(:email).should eq(email)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Email" do
        expect {
          post :create, :email => valid_attributes
        }.to change(Email, :count).by(1)
      end

      it "assigns a newly created email as @email" do
        post :create, :email => valid_attributes
        assigns(:email).should be_a(Email)
        assigns(:email).should be_persisted
      end

      it "redirects to the created email" do
        post :create, :email => valid_attributes
        response.should redirect_to(Email.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved email as @email" do
        # Trigger the behavior that occurs when invalid params are submitted
        Email.any_instance.stub(:save).and_return(false)
        post :create, :email => {}
        assigns(:email).should be_a_new(Email)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Email.any_instance.stub(:save).and_return(false)
        post :create, :email => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested email" do
        email = Email.create! valid_attributes
        # Assuming there are no other emails in the database, this
        # specifies that the Email created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Email.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => email.id, :email => {'these' => 'params'}
      end

      it "assigns the requested email as @email" do
        email = Email.create! valid_attributes
        put :update, :id => email.id, :email => valid_attributes
        assigns(:email).should eq(email)
      end

      it "redirects to the email" do
        email = Email.create! valid_attributes
        put :update, :id => email.id, :email => valid_attributes
        response.should redirect_to(email)
      end
    end

    describe "with invalid params" do
      it "assigns the email as @email" do
        email = Email.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Email.any_instance.stub(:save).and_return(false)
        put :update, :id => email.id.to_s, :email => {}
        assigns(:email).should eq(email)
      end

      it "re-renders the 'edit' template" do
        email = Email.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Email.any_instance.stub(:save).and_return(false)
        put :update, :id => email.id.to_s, :email => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested email" do
      email = Email.create! valid_attributes
      expect {
        delete :destroy, :id => email.id.to_s
      }.to change(Email, :count).by(-1)
    end

    it "redirects to the emails list" do
      email = Email.create! valid_attributes
      delete :destroy, :id => email.id.to_s
      response.should redirect_to(emails_url)
    end
  end

end
