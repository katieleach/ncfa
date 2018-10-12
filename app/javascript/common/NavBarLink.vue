<template>
    <span class="navbar__link">{{item.name}}</span>
</template>

<script>
export default {
    props: {
        item: {
            required: true
        }
    }
}
</script>
