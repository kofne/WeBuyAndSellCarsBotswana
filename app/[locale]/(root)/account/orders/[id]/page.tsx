import { notFound } from 'next/navigation'
import React from 'react'
import Link from 'next/link'

import { auth } from '@/auth'
import { getOrderById } from '@/lib/actions/order.actions'
import OrderDetailsForm from '@/components/shared/order/order-details-form'
import { formatId } from '@/lib/utils'

export async function generateMetadata(props: { params: { id: string } }) {
  const { id } = props.params
  return {
    title: `Order ${formatId(id)}`,
  }
}

export default async function OrderDetailsPage(props: { params: { id: string } }) {
  const { id } = props.params

  const order = await getOrderById(id)
  if (!order) notFound()

  const session = await auth()
  const orderIdStr = order._id.toString() // ✅ Convert ObjectId to string

  return (
    <>
      <div className="flex gap-2">
        <Link href="/account">Your Account</Link>
        <span>›</span>
        <Link href="/account/orders">Your Orders</Link>
        <span>›</span>
        <span>Order {formatId(orderIdStr)}</span>
      </div>

      <h1 className="h1-bold py-4">Order {formatId(orderIdStr)}</h1>

      <OrderDetailsForm
        order={order}
        isAdmin={session?.user?.role === 'Admin' || false}
      />
    </>
  )
}

