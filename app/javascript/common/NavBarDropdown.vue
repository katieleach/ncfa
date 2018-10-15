<template>
    <div class="nav__dropdown" :class="isActive ? 'nav__dropdown--active' : 'nav__dropdown--inactive'">
        <div class="flex nav__dropdown-toggle" @click="click()">
            <span class="nav__select">{{item.name}}</span>
            <span class="nav__dropdown-caret">&nbsp;V&nbsp;</span>
        </div>
        <div class="nav__dropdown-menu">
            <div class="nav__dropdown-point"></div>
            <div class="nav__dropdown-body" :class="{'nav__dropdown--two-col': hasTwoColumns}">
                <nav-bar-link class="nav__dropdown-item" 
                    v-for="dropdownItem in item.children" 
                    :item="dropdownItem" 
                    :key="dropdownItem.id">
                </nav-bar-link>
            </div>
        </div>
    </div>
</template>

<script>
import NavBarLink from './NavBarLink';

export default {
    components: {
        NavBarLink
    },
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