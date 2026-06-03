using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EComProject
{
    public  interface ICheckoutHandler
    {
        void HandleRequest(CheckoutContext context);

        ICheckoutHandler SetNext(ICheckoutHandler nextHandler);
    }


    public abstract class CheckoutHandler: ICheckoutHandler
    {
        private  ICheckoutHandler _nextHandler;

        public ICheckoutHandler SetNext(ICheckoutHandler nextHandler)
        {
            _nextHandler = nextHandler;

            return nextHandler;
        }

        public virtual void  HandleRequest(CheckoutContext context)
        {
            if(_nextHandler != null)
            {
                _nextHandler.HandleRequest(context);
            }
        }
    }
    public class CheckoutContext
    {
        public string User { get; set; }
        public bool IsCartValid { get; set; }
        public bool IsAddressValid { get; set; }
        public bool IsPaymentProcessed { get; set; }
    }
    public class CartHandler : CheckoutHandler
    {
        public override void HandleRequest(CheckoutContext context)
        {
            
            base.HandleRequest(context);
        }
    }
    public class AddressHandler : CheckoutHandler
    {
        public override void HandleRequest(CheckoutContext context)
        {
            

            
            base.HandleRequest(context);
        }
    }
    public class PaymentHandler : CheckoutHandler
    {
        public override void HandleRequest(CheckoutContext context)
        {
            // Perform payment processing logic
            context.IsPaymentProcessed = true; 

            
            base.HandleRequest(context);
        }
    }

}
