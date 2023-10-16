<template>
    <button class="v-btn-form">{{title}}</button>
</template>

<script>
export default {
    props: {
        title: String
    }
}
</script>

<style scoped>
.v-btn-form {
    color: #fff;
    text-decoration: none;
    font-weight: 500;
    background: #1cb0f6;
    border-radius: 7px;
    border: none;
    box-shadow: 0 4px 0 #229bd5;
    padding: 9px 20px;
    font-size: 20px;
    transition: all .3s ease-in-out 0s;
    cursor: pointer;
    box-sizing: border-box;
}
</style>