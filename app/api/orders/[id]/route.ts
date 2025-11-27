// app/api/orders/[id]/route.ts
import { NextResponse } from 'next/server';
import { connectDb } from '@/lib/db/mongoose';
import Order from '@/lib/db/models/order.model';
import type { Params } from 'next/dist/shared/lib/router/utils/route-matcher'; // optional type

export async function GET(_req: Request, { params }: { params: { id: string } }) {
  try {
    await connectDb();
    const order = await Order.findById(params.id).lean();
    if (!order) return NextResponse.json({ message: 'Order not found' }, { status: 404 });
    return NextResponse.json(order);
  } catch (err) {
    return NextResponse.json({ message: 'Server error', error: String(err) }, { status: 500 });
  }
}
