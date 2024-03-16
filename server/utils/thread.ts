import { eq } from 'drizzle-orm';
import type { Thread, ThreadMessage } from '../database/schema';

class ThreadService {
	async getThreadById(id: string): Promise<Thread | null> {
		const [thread] = await db.select().from(tables.thread).where(eq(tables.thread.id, id));
		return thread;
	}

	async getThreadsByUserId(userId: string): Promise<Thread[]> {
		return db.select().from(tables.thread).where(eq(tables.thread.userId, userId));
	}

	async getMessagesByThreadId(threadId: string): Promise<ThreadMessage[]> {
		return db.select().from(tables.threadMessage).where(eq(tables.threadMessage.threadId, threadId));
	}

	async createThread(thread: Thread): Promise<Thread> {
		const [newThread] = await db.insert(tables.thread).values(thread).returning();
		return newThread;
	}

	async updateThread(id: string, thread: Partial<Thread>): Promise<Thread> {
		const [updatedThread] = await db.update(tables.thread).set(thread).where(eq(tables.thread.id, id)).returning();
		return updatedThread;
	}

	async deleteThread(id: string): Promise<void> {
		await db.delete(tables.thread).where(eq(tables.thread.id, id));
	}

	async createMessage(message: ThreadMessage): Promise<ThreadMessage> {
		const [newMessage] = await db.insert(tables.threadMessage).values(message).returning();
		return newMessage;
	}

	async updateMessage(id: string, message: Partial<ThreadMessage>): Promise<ThreadMessage> {
		const [updatedMessage] = await db.update(tables.threadMessage).set(message).where(eq(tables.threadMessage.id, id)).returning();
		return updatedMessage;
	}

	async deleteMessage(id: string): Promise<void> {
		await db.delete(tables.threadMessage).where(eq(tables.threadMessage.id, id));
	}
}

export const threadService = new ThreadService();
