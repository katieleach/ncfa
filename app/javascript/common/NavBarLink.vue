<template>
    <span class="navbar__link navbar__select">{{item.name}}</span>
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
