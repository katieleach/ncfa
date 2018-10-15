<template>
    <span class="navbar__link nav__select">{{item.name}}</span>
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
