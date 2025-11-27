// lib/db/mongoose.ts
import mongoose from 'mongoose';

const MONGODB_URI = process.env.MONGODB_URI;

if (!MONGODB_URI) {
  throw new Error('Please define the MONGODB_URI environment variable inside .env.local');
}

// Cache the connection on global to avoid multiple connections in dev
declare global {
  // eslint-disable-next-line no-var
  var mongooseConnection: {
    conn?: typeof mongoose | null;
    promise?: Promise<typeof mongoose> | null;
  };
}

const globalWithMongoose = global as unknown as typeof global & {
  mongooseConnection?: {
    conn?: typeof mongoose | null;
    promise?: Promise<typeof mongoose> | null;
  };
};

if (!globalWithMongoose.mongooseConnection) {
  globalWithMongoose.mongooseConnection = { conn: null, promise: null };
}

export async function connectDb() {
  if (globalWithMongoose.mongooseConnection!.conn) {
    return globalWithMongoose.mongooseConnection!.conn!;
  }

  if (!globalWithMongoose.mongooseConnection!.promise) {
    globalWithMongoose.mongooseConnection!.promise = mongoose.connect(MONGODB_URI).then((m) => {
      return m;
    });
  }
  globalWithMongoose.mongooseConnection!.conn = await globalWithMongoose.mongooseConnection!.promise;
  return globalWithMongoose.mongooseConnection!.conn!;
}
