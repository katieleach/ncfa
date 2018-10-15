<template>
    <div class="nav__select">{{item.name}}</div>
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
