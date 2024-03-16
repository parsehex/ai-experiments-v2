<script setup lang="ts">
import { useChat } from 'ai/vue';

const pageTitle = 'Role Chat';
const pageDesc = 'Chat with a language model.';

const { messages, input, handleSubmit } = useChat();
</script>

<template>
	<section class="w-full py-12">
		<div class="container grid gap-6 md:gap-8 px-4 md:px-6 max-w-6xl mx-auto">
			<div
				class="flex flex-col md:flex-row items-start md:items-center gap-4 md:gap-8"
			>
				<div class="grid gap-1">
					<h1 class="text-3xl font-bold tracking-tight">
						{{ pageTitle }}
					</h1>
					<p class="text-gray-500 dark:text-gray-400">
						{{ pageDesc }}
					</p>
				</div>
			</div>
			<div class="flex">
				<div class="flex flex-col w-full max-w-md py-24 mx-auto stretch">
					<div v-for="m in messages" :key="m.id" class="whitespace-pre-wrap">
						{{ m.role === 'user' ? 'User: ' : 'AI: ' }}
						{{ m.content }}
					</div>

					<form @submit="handleSubmit">
						<input
							v-model="input"
							class="fixed bottom-0 w-full max-w-md p-2 mb-8 border border-gray-300 rounded shadow-xl"
							placeholder="Say something..."
						>
					</form>
				</div>
			</div>
		</div>
	</section>
</template>
