
    <tbody class="bg-white divide-y divide-gray-200">
    @foreach ($trees as $tree)


        @foreach($tree->children as $tree2)
        @include('trees.subTreeList2',[$tree2->children])
        @endforeach


    @endforeach

    </tbody>

