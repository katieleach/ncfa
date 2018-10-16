<template>
    <a class="nav__select">{{item.name}}</a>
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
