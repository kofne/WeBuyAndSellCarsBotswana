// components/paypal/PayPalButton.tsx
'use client';

import React from 'react';
import { PayPalScriptProvider, PayPalButtons } from '@paypal/react-paypal-js';

type PayPalButtonProps = {
  amount: string | number;
  onSuccess?: (details: any) => void;
};

export default function PayPalButton({ amount, onSuccess }: PayPalButtonProps) {
  const clientId = process.env.NEXT_PUBLIC_PAYPAL_CLIENT_ID || '';

  // PayPalScriptProvider's options typing can be strict; cast to any for simplicity
  const options = { 'client-id': clientId, currency: 'USD' } as any;

  return (
    <PayPalScriptProvider options={options}>
      <PayPalButtons
        style={{ layout: 'vertical' }}
        createOrder={(data, actions) => {
          return actions.order.create({
            purchase_units: [{ amount: { value: String(amount) } }],
          });
        }}
        onApprove={async (data, actions) => {
          const details = await actions.order?.capture();
          if (details && onSuccess) onSuccess(details);
        }}
      />
    </PayPalScriptProvider>
  );
}
