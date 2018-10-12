<template>
    <div class="navbar__dropdown" 
        :class="isActive ? 'navbar__dropdown--active' : 'navbar__dropdown--inactive'">
        <div class="flex navbar__dropdown-toggle" :title="item.name" @click="click()">
            <span>{{item.name}}</span>
            <span class="arrowhead">V</span>
        </div>
        <div class="navbar__dropdown-menu">
            <div class="navbar__dropdown-point"></div>
            <div class="flex flex-row flex-wrap navbar__dropdown-body" :class="{'navbar__dropdown--two-col': hasTwoColumns}">
                <div class="navbar__dropdown-item" 
                    v-for="dropdownItem in item.children" 
                    :key="dropdownItem.id">{{dropdownItem.name}}
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    props: {
        item: {
            required: true,
            type: Object
        },
        isActive: {
            default: false,
            type: Boolean
        },
        hasTwoColumns: {
            dafault: false,
            type: Boolean
        }
    },
    methods: {
        click () {
            this.$emit('navbar-dropdown-click', this.item.id);
        }
    },
    created: function() {
        window.addEventListener('click', e => {
            if (this.isActive && !this.$el.contains(e.target)) {
                this.$emit('navbar-dropdown-click-outside', this.item.id);
            }   
        })
    }
}
</script>