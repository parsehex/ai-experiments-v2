<script setup lang="ts">
const { data } = await useFetch('/api/me/orgs'); // why not use useOrgs?
const defaultSlug = computed(
	() => data.value?.orgs.find(o => o.default)?.org.slug ?? '',
);
navigateTo(`/app/${defaultSlug.value}`);
</script>
