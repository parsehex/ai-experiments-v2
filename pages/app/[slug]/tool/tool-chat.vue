<script setup lang="ts">
const pageTitle = 'Tool Chat';
const pageDesc = 'Chat with a tool-enabled language model.';
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
				<!--  -->
			</div>
		</div>
	</section>
</template>
