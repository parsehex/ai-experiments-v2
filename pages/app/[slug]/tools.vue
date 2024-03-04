<script setup lang="ts">
interface Category {
	name: string
}
interface Tag {
	name: string
}
interface Tool {
	name: string
	description: string
	categories: Category[]
	tags?: Tag[]
}

const categories = {
	all: { name: 'All Tools' },
	productivity: { name: 'Productivity' },
	creativity: { name: 'Creativity' },
} satisfies Record<string, Category>;
const catArr = Object.values(categories);

const tags = {
	llm: { name: '#LLM' },
	tts: { name: '#TTS' },
	stt: { name: '#STT' },
} satisfies Record<string, Tag>;
const tagArr = Object.values(tags);

const tools: Tool[] = [
	{
		name: 'Role Chat',
		description: '',
		categories: [categories.creativity],
	},
	{
		name: 'StoryGen',
		description: '',
		categories: [categories.creativity],
	},
	{
		name: 'Read Aloud',
		description: '',
		categories: [categories.productivity],
	},
	{
		name: 'Tool Chat',
		description: '',
		categories: [categories.productivity],
	},
];

const selectedCategory = ref(categories.all.name);
function setFilter(f: string) {
	selectedCategory.value = f;
}
const filteredTools = computed(() => {
	if (selectedCategory.value === 'All Tools')
		return tools;
	return tools.filter(tool =>
		tool.categories.some(
			category => category.name === selectedCategory.value,
		),
	);
});
</script>

<template>
	<section class="w-full py-12">
		<div class="container grid gap-6 md:gap-8 px-4 md:px-6 max-w-6xl mx-auto">
			<div
				class="flex flex-col md:flex-row items-start md:items-center gap-4 md:gap-8"
			>
				<div class="grid gap-1">
					<h1 class="text-3xl font-bold tracking-tight">
						AI Tools
					</h1>
					<p class="text-gray-500 dark:text-gray-400">
						Discover a collection of powerful AI-powered tools.
					</p>
				</div>
			</div>
			<div class="grid gap-6">
				<div class="flex items-center gap-4">
					<h3 class="font-semibold text-gray-500 dark:text-gray-400">
						Categories
					</h3>
					<button
						v-for="category in catArr"
						:key="category.name"
						class="font-semibold"
						@click="setFilter(category.name)"
					>
						{{ category.name }}
					</button>
				</div>
				<div class="grid gap-2">
					<div class="flex flex-wrap gap-2">
						<h3 class="font-semibold text-gray-500 dark:text-gray-400">
							Tags
						</h3>
						<button
							v-for="tag in tagArr"
							:key="tag.name"
							class="border border-gray-200 dark:border-gray-800 bg-gray-100 dark:bg-gray-900 px-3 py-1 rounded-full text-sm"
							@click="setFilter(tag.name)"
						>
							{{ tag.name }}
						</button>
					</div>
				</div>
				<div class="grid md:grid-cols-2 lg:grid-cols-3 gap-6">
					<div
						v-for="tool in filteredTools"
						:key="tool.name"
						class="grid gap-2"
					>
						<NuxtLink :to="`./tool/${tool.name.toLowerCase().replace(' ', '-')}`" class="font-semibold">
							{{ tool.name }}
						</NuxtLink>
						<p class="text-sm leading-none text-gray-500 dark:text-gray-400">
							{{ tool.description }}
						</p>
					</div>
				</div>
			</div>
		</div>
	</section>
</template>
