<template>
    <a class="nav__select" :href="item.link">{{item.name}}</a>
</template>

<script>
export default {
    props: {
        item: {
            required: true,
            type: Object
        }
    }
}
</script>
