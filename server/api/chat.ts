import { OpenAIStream } from 'ai';
import process from 'node:process';
import type { ClientOptions } from 'openai';
import OpenAI from 'openai';
import type { ChatCompletionMessageParam } from 'openai/resources/chat';

const useOpenRouter = process.env.USE_OPENROUTER === 'true';

export default defineLazyEventHandler(async () => {
	let apiKey = process.env.OPENAI_API_KEY;
	if (useOpenRouter)
		apiKey = process.env.OPENROUTER_API_KEY;
	if (!apiKey)
		throw new Error('Missing OpenAI API key');
	const apiOptions: ClientOptions = {	apiKey };
	if (useOpenRouter)
		apiOptions.baseURL = 'https://openrouter.ai/api/v1';

	const openai = new OpenAI(apiOptions);

	return defineEventHandler(async (event) => {
		// Extract the `prompt` from the body of the request
		const { messages } = (await readBody(event)) as {
			messages: ChatCompletionMessageParam[]
		};

		// Ask OpenAI for a streaming chat completion given the prompt
		const response = await openai.chat.completions.create({
			model: 'gpt-3.5-turbo',
			stream: true,
			messages: messages.map(message => ({
				content: message.content,
				role: message.role,
			})) as any,
		});

		// Convert the response into a friendly text-stream
		return OpenAIStream(response);
	});
});
