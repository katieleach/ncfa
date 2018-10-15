<template>
    <div class="nav__dropdown" 
        :class="isActive ? 'nav__dropdown--active' : 'nav__dropdown--inactive'">
        <div class="flex nav__dropdown-toggle" @click="click()">
            <span class="nav__select">{{item.name}}</span>
            <span class="arrowhead">&nbsp;V&nbsp;</span>
        </div>
        <div class="nav__dropdown-menu">
            <div class="nav__dropdown-point"></div>
            <div class="nav__dropdown-body" :class="{'nav__dropdown--two-col': hasTwoColumns}">
                <div class="nav__dropdown-item nav__select" 
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
        }
    },
    computed: {
        hasTwoColumns: function () {
            return this.item.children.length > 4;
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