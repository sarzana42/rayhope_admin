class Rayadmin::CustomersController < Rayadmin::RayadminController
    
    def index
        # @customers = Customer.all
        @q = Customer.ransack(params[:q])
        @customers = @q.result
        
        respond_to do |format|
            format.html
            format.csv { send_data @customers.to_csv }
            format.xls { send_data @customers.to_csv(col_sep: "\t") }
        end
        
    end
    
    def new
        @customer = Customer.new
    end
    
    def show
        @customer = Customer.find params[:id]
    end
    
    def edit
        @customer = Customer.find params[:id]
    end
    
    def create
        @customer = Customer.new(customer_params)
            if @customer.save
                redirect_to customer_path(@customer) , notice: 'メッセージを保存しました'
             else
                @customers = Customer.all
                flash.now[:alert] = "メッセージの保存に失敗しました。"
                render :new
            end
        
    end
    
    def update
        @customer = Customer.find params[:id]
        if @customer.update(customer_params)
            redirect_to [:rayadmin, @customer]
        else
            render 'edit'
        end
    end
    def destroy
        @customer = Customer.find params[:id]
        @customer.destroy
        redirect_to rayadmin_customers_path, notice: '削除しました。'
    end
    
    def import
        # fileはtmpに自動で一時保存される
        Customer.import(params[:file])
        redirect_to root_url, notice: "商品を追加しました。"
    end
    
    private
    
    def customer_params
        params.require(:customer).permit(:name1, :name2, :kana1, :kana2, :zip, :address1, :address2, :address3, :tel1, :tel2, :fax, :email, :remark)
    end
    
end
